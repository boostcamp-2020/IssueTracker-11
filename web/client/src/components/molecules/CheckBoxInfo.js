import React, { useContext } from 'react';
import styled from 'styled-components';
import CheckBox from '@atoms/CheckBox';
import Span from '@atoms/Span';
import { CheckboxContext } from '../../store/checkbox';
const StyledCheckBoxInfo = styled.div`
    display: flex;
`;

const CheckBoxInfo = () => {
    const { checkState } = useContext(CheckboxContext);
    console.log(checkState.ids);
    const checked = checkState.ids.length;
    const children = checked ? ` ${Math.ceil(checked / 2)} selected` : null;
    return (
        <StyledCheckBoxInfo>
            <CheckBox name="checkAll" />
            <Span children={children} />
        </StyledCheckBoxInfo>
    );
};

export default CheckBoxInfo;
