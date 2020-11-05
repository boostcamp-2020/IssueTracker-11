import React from 'react';
import styled from 'styled-components';
import Button from '@atoms/Button.js';
import ButtonGroup from '@molecules/ButtonGroup.js';
import SearchBar from '@molecules/SearchBar.js';

const StyledNavigation = styled.div`
    display: flex;
`;

const Navigation = () => {
    return (
        <StyledNavigation>
            <SearchBar></SearchBar>
            <ButtonGroup></ButtonGroup>
            <Button text="New issue" backgroundColor="#28a745" radius="true" fontColor="white"></Button>
        </StyledNavigation>
    );
};

Navigation.defaultProps = {};

export default Navigation;
