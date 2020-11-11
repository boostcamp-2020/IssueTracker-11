import React, { useContext } from 'react';
import styled from 'styled-components';
import CheckBoxInfo from '@molecules/CheckBoxInfo';
import DropDownGroup from '@organisms/DropDownGroup';
import { CheckboxContext } from '../../store/checkbox';
import DropDown from '@organisms/DropDown';
const StyledIssueListHeader = styled.div`
    border: 1px solid #aaaaaa;
    display: flex;
    justify-content: space-between;
    background-color: #eeeeee;
    padding: 16px;
    font-size: 14px;
    height: 55px;
    box-sizing: border-box;
    height: 100%;
    border-radius: 4px 4px 0px 0px;
`;

const IssuListHeader = () => {
    const { checkState } = useContext(CheckboxContext);
    const checked = checkState.ids.length;
    const children = checked ? ` ${Math.ceil(checked / 2)} selected` : null;
    return (
        <StyledIssueListHeader>
            <CheckBoxInfo children={children} />
            {checked ? (
                <div style={{ height: 21 }}>
                    <DropDown subject="Mark as" items={['open', 'closed']} backgroundColor="inherit" />
                </div>
            ) : (
                <DropDownGroup />
            )}
        </StyledIssueListHeader>
    );
};

export default IssuListHeader;
