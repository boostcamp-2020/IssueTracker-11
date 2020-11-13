import React, { useState } from 'react';
import MDEditor from '@uiw/react-md-editor';
import styled from 'styled-components';

const MarkdownContainer = styled.div`
    height: 100%;
    .w-md-editor-toolbar {
        height: 10%;
    }
    .w-md-editor-content {
        height: 90%;
        .w-md-editor-bar {
            display: none;
        }
    }
`;

const Markdown = ({ setIssueContent }) => {
    const [markdownContent, setMarkdownContent] = useState(null);

    const handleContentChange = (value) => {
        setMarkdownContent(value);
        setIssueContent(value);
    };

    return (
        <MarkdownContainer>
            <MDEditor value={markdownContent} onChange={handleContentChange} height="100%" />
        </MarkdownContainer>
    );
};

export default Markdown;
