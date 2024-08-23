// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import{Test}from "forge-std/Test.sol";
import{Instagram}from "../contracts/Instagram.sol";

contract InstagramTest is Test {

    Instagram public instagram;

        event PostAdded(uint256 indexed postId, string description, address owner);
        event Like(uint256 indexed postId, address user);
        event Unlike(uint256 indexed postId, address user);

    function setUp() public {
        instagram = new Instagram();
    }

    function testFail_AddPost() external {   
        Instagram.Post memory post = Instagram.Post("desc1", "");
        instagram.addPost(post);	
         }

          function testAddPost() external {   
            Instagram.Post memory post = Instagram.Post("desc1", "uri");
            vm.expectEmit(true, false, false, false);
            emit PostAdded(instagram.s_postCounterId()+1, "desc1", address(this));
            instagram.addPost(post);
            assertEq(instagram.s_postCounterId(), 1);	
            Instagram.Post memory _post = instagram.getPost(1);
            assertEq(_post.description, "desc1");
            assertEq(_post.uri, "uri");

      }

    function test_LikePost() external {
        uint256 postId = 1;
        _addPost();
        vm.expectEmit(true, false, false, true);
        emit Like(postId, address(this));
        instagram.like(postId);
        uint256 likes = instagram.getLikesOfPost(postId);
        assertEq(likes, 1);
}
    function test_UnlikePost() external {
        uint256 postId = 1;
        _addPost();
        instagram.like(postId);
        vm.expectEmit(true, false, false, true);
        emit Unlike(postId, address(this));
        instagram.unlike(postId);
        uint256 likes = instagram.getLikesOfPost(postId);
        assertEq(likes, 0);
}

    function test_GetPost() external {  
        uint256 postId = 1;
        vm.expectRevert();
        instagram.getPost(postId);
        _addPost();
        Instagram.Post memory post = instagram.getPost(postId);
}

    function _addPost() internal {
        Instagram.Post memory post = Instagram.Post({description:"description", uri: "ipfs://"});
        instagram.addPost(post);
}

}