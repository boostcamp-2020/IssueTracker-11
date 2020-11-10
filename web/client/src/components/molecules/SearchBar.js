import React, { useState } from 'react';
import styled from 'styled-components';
import { Button } from '@atoms/Button.js';
import Input from '@atoms/Input.js';
import SVG from '@atoms/SVG.js';
import SubmitButton from '@atoms/SubmitButton.js';
import DropDown from '../organisms/DropDown';

const StyledSearchBar = styled.div`
    display: ${({ display }) => display};
    width: ${({ width }) => width};
`;

const SearchBar = ({ display, width }) => {
    const IssueDispatch = React.createContext(null);

    const submit = async () => {
        const context = document.getElementById('searchBox')?.value;
        const data = await fetch('http://49.50.160.103:3000/issues')
            .then((res) => res.json())
            .then((res) => res);

        return data;
    };

    return (
        <StyledSearchBar display={display.display} width={width}>
            <DropDown
                subject="filter"
                isClicked="true"
                items={[
                    'Open issues and pull requests',
                    'Your issues',
                    'Your pull requests',
                    'Everything assigned to you',
                    'Everything mentioning you',
                    'View advanced search syntax',
                ]}
            ></DropDown>
            <Input id="searchBox" placeholder="Search all issues" width="90%" height="36px" border="true"></Input>
            <SubmitButton onClick={submit} text=""></SubmitButton>
        </StyledSearchBar>
    );
};

SearchBar.defaultProps = {
    border: '1px solid red',
};

export default SearchBar;
