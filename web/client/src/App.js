import React, { useContext, useState } from 'react';
import Title from '@atoms/Title.js';
import GlobalStyle from '@themes/GlobalStyle.js';
import Routes from '@pages/Routes.js';
import IndexStore from './store/IndexStore';

export const AppContext = React.createContext();

export default function App() {
    const [data, setData] = useState([]);

    const onSelectData = (newThing) => {
        setData([...data, newThing]);
    };

    const getData = () => data;

    return (
        <IndexStore>
            <AppContext.Provider value={{ onSelectData, getData }}>
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
            </AppContext.Provider>
        </IndexStore>
    );
}
