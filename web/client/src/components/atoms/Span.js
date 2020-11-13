import React from 'react';
import styled from 'styled-components';

const LARGE = '22px';
const MEDIUM = '18px';
const SMALL = '14px';

const StyledSpan = styled.span`
    display: flex;
    justify-content: center;
    align-items: center;
    color: ${({ color }) => color};
    font-weight: ${({ fontWeight }) => fontWeight === 'bold' && 'bold'};
    font-size: ${(fontSize) => {
        return fontSize === 'large' ? LARGE : fontSize === 'medium' ? MEDIUM : fontSize === 'small' ? SMALL : fontSize;
    }};
    &:hover {
    }
`;

const Span = ({ children, fontColor, fontSize, fontWeight }) => (
    <StyledSpan color={fontColor} fontSize={fontSize} fontWeight={fontWeight}>
        {children}
    </StyledSpan>
);

Span.defaultProps = {
    fontColor: 'black',
    fontSize: 'medium',
};

export default Span;
