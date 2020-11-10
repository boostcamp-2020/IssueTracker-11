import React from 'react';
import { Route, BrowserRouter as Router } from 'react-router-dom';
import Issue from '@pages/Issue.js';
import Label from '@pages/Label.js';
import Milestone from '@pages/Milestone.js';
import Navigation from '../organisms/Navigation.js';
import IssueNote from '@pages/IssueNote.js';

const Routes = () => {
    return (
        <Router style={{ width: '100%' }}>
            <Navigation style={{ width: '100%' }}></Navigation>
            <main style={{ paddingLeft: '10%', paddingRight: '10%', paddingTop: '30px' }}>
                <Route exact path="/" component={Issue} />
                <Route path="/label" component={Label} />
                <Route path="/milestone" component={Milestone} />
                <Route path="/issuenote" component={IssueNote} />
            </main>
        </Router>
    );
};

export default Routes;
