import React from 'react';
import { Route, BrowserRouter as Router } from 'react-router-dom';
import Issue from '@pages/Issue.js';
import Label from '@pages/Label.js';
import Milestone from '@pages/Milestone.js';
import Navigation from '../organisms/Navigation';

const Routes = () => {
    return (
        <Router>
            <Navigation />
            <main style={{ paddingLeft: '10%' }}>
                <Route exact path="/" component={Issue} />
                <Route path="/label" component={Label} />
                <Route path="/milestone" component={Milestone} />
            </main>
        </Router>
    );
};

export default Routes;
