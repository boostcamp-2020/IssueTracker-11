import React, { useContext } from 'react';
import styled from 'styled-components';
import CheckBox from '@atoms/CheckBox';
import Span from '@atoms/Span';
import Padding from '@atoms/Padding';
const StyledCheckBoxInfo = styled.div`
    display: flex;
`;

const CheckBoxInfo = ({ children }) => {
    return (
        <StyledCheckBoxInfo>
            <Padding padding="0 7px 0 0">
                <CheckBox name="checkAll" />
            </Padding>
            <Span children={children} />
        </StyledCheckBoxInfo>
    );
};

export default CheckBoxInfo;
