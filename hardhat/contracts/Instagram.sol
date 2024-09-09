// SPDX-License-Identifier: MIT
/**
 * @title Clone instagram Web3
 * @author Kalcha
 * @notice You can use this contract to clone instagram web3 social media
 * @dev A este contrato le faltan más funciones pero cumple con lo minimo requerido
 */
pragma solidity ^0.8.24;

contract Instagram {

    ///@notice counter for posts
    uint256 public s_postCounterId;
    
    /**
     * @dev un struct que define o representa un post en la plataforma
     * @param description descripcio de la publicacion
     * @param uri url de la publicacion
     */
    struct Post {
        string description;
        string uri;
    }

    ///@notice Mapping para almacenar los post y su identificador
    mapping(uint256 => Post) private s_posts;
    mapping(address => mapping(uint256 => Post)) private s_postsUser;
    mapping(address => uint256) private s_postsCounterByUser;
    mapping(uint256 => address[]) private s_likesOfPost;

    /**
     * @dev evento para registrar un nuevo post
     * @param postId el id del post recien creado
     * @param description  la descripcio del post
     * @param owner la direccion de la creacion del post
     */
    event PostAdded(uint256 indexed postId, string description, address owner);
    event Like(uint256 indexed postId, address user);
    event Unlike(uint256 indexed postId, address user);

    /**
     * @dev error para notificar que el post no existe
     * @param postId el Id del post que no existe
     */
    error PostDoesNotExist(uint256 postId);

    /**
     * @notice Recupera un post especifico de un usuario en la plataforma de Instagram
    * @param _post toda la informacion del post
     
     */
    function addPost(Post memory _post)external {
        require(bytes(_post.uri).length > 0,"Uri cannot be empty"); 
        s_postCounterId++;
        s_posts[s_postCounterId] = _post;
        s_postsUser[msg.sender][s_postCounterId] = _post;
        s_postsCounterByUser[msg.sender]++;
        emit PostAdded(s_postCounterId, _post.description, msg.sender);

}
function like(uint256 _postId)external postsExists(_postId) {
    s_likesOfPost[_postId].push(msg.sender);
    emit Like(_postId, msg.sender);
}

function unlike(uint256 _postId)external postsExists(_postId){
    address[]storage addresses = s_likesOfPost[_postId];

    for(uint256 index=0; index < addresses.length; index++){
        if(addresses[index] == msg.sender){
            address lastlike = addresses[addresses.length-1];
            addresses[index] = lastlike;
            addresses.pop();
            break;
        }
    }   

        emit Unlike(_postId, msg.sender);
}

function getPost(uint256 _postId)public view postsExists(_postId) returns(Post memory){
    return s_posts[_postId];
}

function getPostUser(address _user, uint256 _postId)public view postsExists(_postId) returns(Post memory){ 
    return s_postsUser[_user][_postId];
    }
function getPostCounterByUser(address _user)public view returns(uint256){
    return s_postsCounterByUser[_user];
}

function getLikesOfPost(uint256 _postId)public view postsExists(_postId) returns(uint256){
    return s_likesOfPost[_postId].length;

 }

 function getUri(uint256 _postId)public view postsExists(_postId) returns(string memory){
    return s_posts[_postId].uri;

 }
    ///@notice Optiene tidos los posts en un rango de identificadores
    ///@param _start el identificador inicial
    ///@param _end el identificador final
    ///@return un array de posts en el rango especificado
 function getAllPosts(uint256 _start, uint256 _end)public view returns(Post[]memory){
   require(_start > 0 && _end > _start, "Start must be greater than 0");
   require(s_postCounterId >= _end, "End is greater than total post");
   uint256 length = _end - _start + 1;
   Post[] memory posts = new Post[](length);
   for  (uint256 index = 0; index < length; index++){
        posts[index] = s_posts[_start + index];
   }
   return posts;
}


modifier postsExists(uint256 _postId){
    if(_postId > s_postCounterId  || _postId == 0)revert PostDoesNotExist(_postId);
        _;
    }
        
}



 