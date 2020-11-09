import React from 'react';
import styled from 'styled-components';

const ImageWrap = styled.div`
    width: ${(props) => props.height};
    height: ${(props) => props.width};
    border-radius: 50%;
    overflow: hidden;
    position: absolute;
    margin-left: 60px;
    margin-top: 17px;
`;

const ProfileImage = (props) => {
    return (
        <ImageWrap width={props.width} height={props.height}>
            <img src={props.src} alt="profile" width="100%" height="100%"></img>
        </ImageWrap>
    );
};

export default ProfileImage;
