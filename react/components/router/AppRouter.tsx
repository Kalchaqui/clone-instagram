import React from 'react'
import {Routes, Route} from "react-router-dom"
import Create from "../../pages/Create"
import Home from "../../pages/Home"
import Feed from "../../pages/Feed"

const AppRoutes: React.FC = () => {
    return (
        <Routes>
            <Route path="/" element={} />
            <Route path="/feed" element={} />
            <Route path="/create" element={} />
        </Routes>
    )
}