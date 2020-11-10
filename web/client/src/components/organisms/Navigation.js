import React, { useState } from 'react';
import styled from 'styled-components';
import Button from '@atoms/Button.js';
import SearchBar from '@molecules/SearchBar.js';
import Header from '@molecules/Header.js';

const StyledNavigation = styled.div`
    display: flex;
    justify-content: space-between;
    width: 100%;
    padding-left: 10%;
    padding-right: 10%;
    margin-top: 60px;
`;

const Navigation = () => {
    const [display, setDisplay] = useState('flex');
    const sendDatatoParent = (value) => {
        console.log(value);
        setDisplay(value);
    };
    console.log(display);

    return (
        <StyledNavigation>
            <SearchBar display={{ display }} width="85%"></SearchBar>
            <Header sendDataToParent={sendDatatoParent}></Header>
        </StyledNavigation>
    );
};

Navigation.defaultProps = {};

export default Navigation;
