import React, { useContext } from 'react';
import styled from 'styled-components';
import CheckBox from '@atoms/CheckBox';
import Span from '@atoms/Span';

const StyledCheckBoxInfo = styled.div`
    display: flex;
`;

const CheckBoxInfo = ({ children }) => {
    return (
        <StyledCheckBoxInfo>
            <CheckBox name="checkAll" />
            <Span children={children} />
        </StyledCheckBoxInfo>
    );
};

export default CheckBoxInfo;
