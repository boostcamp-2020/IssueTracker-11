import React from 'react';
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
    return (
        <StyledNavigation>
            <SearchBar style={{ width: '80%' }}></SearchBar>
            <Header style={{ width: '20%' }}></Header>
        </StyledNavigation>
    );
};

Navigation.defaultProps = {};

export default Navigation;
