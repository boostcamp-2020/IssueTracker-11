import React from 'react';
import { Link } from 'react-router-dom';
import { Button } from '@atoms/Button.js';

const Header = () => {
    return (
        <header style={{ display: 'flex' }}>
            <Link to="/label">
                <Button backgroundColor="white" border="true" text="labels"></Button>
            </Link>
            <Link to="/milestone">
                <Button backgroundColor="white" border="true" text="milestones" width="auto"></Button>
            </Link>
            <Link to="/">
                <Button text="New issue" backgroundColor="#28a745" radius="true" fontColor="white"></Button>
            </Link>
        </header>
    );
};

export default Header;
