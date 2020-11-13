import React from 'react';
import styled from 'styled-components';

const getTextColor = (bgColor) => {
    if (!bgColor) return '';
    return parseInt(bgColor.replace('#', ''), 16) > 0xffffff / 2 ? '#000' : '#fff';
};

const LabelDiv = styled.div`
    display: inline-block;
    text-align: center;
    text-shadow: 0px 1px rgba(1, 1, 1, 0.3);
    border-radius: 10px;
    padding: 3px 10px 3px 10px;
    font-size: ${(props) => props.fontSize};
    color: ${(props) => getTextColor(props.background)};
    background: ${(props) => (props.background ? props.background : '#000000')};
`;

const Label = (props) => {
    return (
        <LabelDiv fontSize={props.fontSize} background={props.background}>
            {props.name}
        </LabelDiv>
    );
};

export default Label;
