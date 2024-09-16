import './App.css'
import { BrowserRouter as Router, Link } from 'react-router-dom'
import AppRoutes from './components/router/AppRouter'

function App() {
  

  return (
    <>
    <Router>
      <div>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/feed">Feed</Link>
            </li>
            <li>
              <Link to="/create">Create</Link>
            </li>
          </ul>

        </nav>
      <AppRoutes />
      </div>
    </Router>
    
    <h1>Clon Instagram</h1>
    </>
  )
}

export default App
