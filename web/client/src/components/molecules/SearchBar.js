import React from 'react';
import styled from 'styled-components';
import { Button } from '@atoms/Button.js';
import Input from '@atoms/Input.js';
import SVG from '@atoms/SVG.js';
import SubmitButton from '@atoms/SubmitButton.js';

const StyledSearchBar = styled.div`
    display: flex;
`;

const SearchBar = () => {
    const submit = async () => {
        let context = document.getElementById('searchBox')?.value;

        let res = await fetch('http://127.0.0.1:4000/issues')
            .then((res) => res.json())
            .then((res) => console.log(res));
        console.log(res);
    };

    return (
        <StyledSearchBar>
            <Button border="true" text="filters">
                <SVG height="18px" fillRule="evenodd" name="search"></SVG>
            </Button>
            <Input id="searchBox" placeholder="Search all issues" width="500px"></Input>
            <SubmitButton onClick={() => submit()} text="enter"></SubmitButton>
        </StyledSearchBar>
    );
};

SearchBar.defaultProps = {};

export default SearchBar;
