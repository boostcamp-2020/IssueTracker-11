import React from 'react';
import Title from '@atoms/Title.js';
import GlobalStyle from '@themes/GlobalStyle.js';
import Routes from '@pages/Routes.js';
import IndexStore from './store/IndexStore';

export default function App() {
    return (
        <IndexStore>
            <div>
                <Title
                    backgroundColor="black"
                    fontColor="white"
                    width="100%"
                    height="100px"
                    text="ISSUE"
                    padding="0px"
                ></Title>
                <Routes style={{ width: '100%' }}></Routes>
                <GlobalStyle />
            </div>
        </IndexStore>
    );
}
