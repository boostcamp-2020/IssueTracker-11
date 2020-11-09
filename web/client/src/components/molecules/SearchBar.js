import React from 'react';
import styled from 'styled-components';
import Button from '@atoms/Button.js';
import Input from '@atoms/Input.js';
import SVG from '@atoms/SVG.js';

const StyledSearchBar = styled.div`
    display: flex;
`;

const SearchBar = () => {
    return (
        <StyledSearchBar>
            <Button border="true" text="filters">
                <SVG height="18px" fillRule="evenodd" name="search"></SVG>
            </Button>
            <Input placeholder="Search all issues" width="200px"></Input>
        </StyledSearchBar>
    );
};

SearchBar.defaultProps = {};

export default SearchBar;
