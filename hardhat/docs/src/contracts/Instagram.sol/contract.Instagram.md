# Instagram
[Git Source](https://github.com/Kalchaqui/clone-instagram/blob/1d9065927558c50c72e46ead1e69b148e60eb0a4/contracts\Instagram.sol)


## State Variables
### s_postCounterId

```solidity
uint256 public s_postCounterId;
```


### s_posts

```solidity
mapping(uint256 => Post) private s_posts;
```


### s_postsUser

```solidity
mapping(address => mapping(uint256 => Post)) private s_postsUser;
```


### s_postsCounterByUser

```solidity
mapping(address => uint256) private s_postsCounterByUser;
```


### s_likesOfPost

```solidity
mapping(uint256 => address[]) private s_likesOfPost;
```


## Functions
### addPost


```solidity
function addPost(Post memory _post) external;
```

### like


```solidity
function like(uint256 _postId) external postsExists(_postId);
```

### unlike


```solidity
function unlike(uint256 _postId) external postsExists(_postId);
```

### getPost


```solidity
function getPost(uint256 _postId) public view postsExists(_postId) returns (Post memory);
```

### getPostUser


```solidity
function getPostUser(address _user, uint256 _postId) public view postsExists(_postId) returns (Post memory);
```

### getPostCounterByUser


```solidity
function getPostCounterByUser(address _user) public view returns (uint256);
```

### getLikesOfPost


```solidity
function getLikesOfPost(uint256 _postId) public view postsExists(_postId) returns (uint256);
```

### getUri


```solidity
function getUri(uint256 _postId) public view postsExists(_postId) returns (string memory);
```

### getAllPosts


```solidity
function getAllPosts(uint256 _start, uint256 _end) public view returns (Post[] memory);
```

### postsExists


```solidity
modifier postsExists(uint256 _postId);
```

## Events
### PostAdded

```solidity
event PostAdded(uint256 indexed postId, string description, address owner);
```

### Like

```solidity
event Like(uint256 indexed postId, address user);
```

### Unlike

```solidity
event Unlike(uint256 indexed postId, address user);
```

## Errors
### PostDoesNotExist

```solidity
error PostDoesNotExist(uint256);
```

## Structs
### Post

```solidity
struct Post {
    string description;
    string uri;
}
```

