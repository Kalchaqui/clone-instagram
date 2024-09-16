import React from "react"
import {Routes, Route} from "react-router-dom"
import Create from "../../pages/Create"
import Home from "../../pages/Home"
import Feed from "../../pages/Feed"

//http://cloninstagram.com/
//http://cloninstagram.com/feed
//http://cloninstagram.com/create
const AppRoutes: React.FC = () => {
    return (
        <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/feed" element={<Feed />} />
            <Route path="/create" element={<Create />} />
        </Routes>
    )
}

export default AppRoutes