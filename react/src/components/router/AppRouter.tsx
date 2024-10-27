import React from "react"
import {Routes, Route} from "react-router-dom"
import Create from "../../pages/Create"
import Home from "../../pages/Home"
import Feed from "../../pages/Feed"
import NewPost from "../../pages/NewPost"

//http://cloninstagram.com/
//http://cloninstagram.com/feed
//http://cloninstagram.com/create
const AppRoutes: React.FC = () => {
    return (
        <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/feed" element={<Feed />} />
            <Route path="create" element={<Create />} />
            <Route path="create/single_image" element={<NewPost />} />

        </Routes>
    );
};

export default AppRoutes;   