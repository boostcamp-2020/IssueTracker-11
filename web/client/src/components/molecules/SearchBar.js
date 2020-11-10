import React from 'react';
import styled from 'styled-components';
import { StyledButton } from '@atoms/Button.js';
import DownArrow from '@atoms/DownArrow';
import Input from '@atoms/Input.js';
import SubmitButton from '@atoms/SubmitButton.js';

const StyledSearchBar = styled.div`
    display: flex;
    justify-content: flex-start;
    width: 60%;
`;
const StyledFilterButton = styled(StyledButton)`
    border: 1px solid #eeeeee;
    background-color: #eeeeee;
    padding: 5px 16px;
`;
const SearchBar = () => {
    const submit = async () => {
        let context = document.getElementById('searchBox')?.value;

        let res = await fetch('http://49.50.160.103:3000/issues')
            .then((res) => res.json())
            .then((res) => console.log(res));
        console.log(res);
    };

    return (
        <StyledSearchBar>
            <StyledFilterButton>
                filters
                <DownArrow />
            </StyledFilterButton>
            <Input id="searchBox" placeholder="Search all issues" width="90%"></Input>
            <SubmitButton onClick={() => submit()} text="enter"></SubmitButton>
        </StyledSearchBar>
    );
};

SearchBar.defaultProps = {};

export default SearchBar;
