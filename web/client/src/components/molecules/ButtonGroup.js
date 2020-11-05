import React from 'react';
import styled from 'styled-components';
import Button from '@atoms/Button.js';
import SVG from '@atoms/SVG.js';

const StyledButtonGroup = styled.div`
    display: flex;

    margin-left: 10px;
    margin-right: 10px;
`;

const ButtonGroup = () => {
    return (
        <StyledButtonGroup>
            <Button backgroundColor="white" border="true" text="labels">
                <SVG height="18px" fillRule="evenodd" name="label"></SVG>
            </Button>
            <Button backgroundColor="white" border="true" text="milestones" width="120px">
                <SVG height="18px" fillRule="evenodd" name="milestone"></SVG>
            </Button>
        </StyledButtonGroup>
    );
};

ButtonGroup.defaultProps = {
    color: 'black',
    fontSize: 'medium',
};

export default ButtonGroup;
