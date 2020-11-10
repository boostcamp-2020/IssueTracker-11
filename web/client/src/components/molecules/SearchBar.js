import React, { useState } from 'react';
import styled from 'styled-components';
import { StyledButton } from '@atoms/Button.js';
import DownArrow from '@atoms/DownArrow';
import Input from '@atoms/Input.js';
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
            <div style={{ border: '1px solid #aaaaaa', height: '100%' }}>
                <DropDown
                    subject="filter"
                    isClicked={false}
                    items={[
                        'Open issues and pull requests',
                        'Your issues',
                        'Your pull requests',
                        'Everything assigned to you',
                        'Everything mentioning you',
                        'View advanced search syntax',
                    ]}
                    lineHeight="36px"
                ></DropDown>
            </div>
            <Input id="searchBox" placeholder="Search all issues" width="90%" height="38px" border="true"></Input>
            <SubmitButton onClick={submit} text=""></SubmitButton>
        </StyledSearchBar>
    );
};

SearchBar.defaultProps = {
    border: '1px solid red',
};

export default SearchBar;
