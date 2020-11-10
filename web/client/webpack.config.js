const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

module.exports = (env, options) => {
    const config = {
        entry: ['@babel/polyfill', './src/index.js'],
        output: {
            filename: '[name].bundle.js',
            path: path.resolve(__dirname, 'dist'),
        },
        optimization: {
            splitChunks: {
                cacheGroups: {
                    commons: {
                        test: /[\\/]node_modules[\\/]/,
                        name: 'vendors',
                        chunks: 'all',
                    },
                },
            },
        },
        resolve: {
            alias: {
                '@atoms': path.resolve(__dirname, 'src/components/atoms'),
                '@molecules': path.resolve(__dirname, 'src/components/molecules'),
                '@organisms': path.resolve(__dirname, 'src/components/organisms'),
                '@pages': path.resolve(__dirname, 'src/components/pages'),
                '@templates': path.resolve(__dirname, 'src/components/templates'),
                '@themes': path.resolve(__dirname, 'src/themes'),
            },
        },
        module: {
            rules: [
                {
                    test: /\.(js|jsx)$/,
                    exclude: /node_modules/,
                    use: {
                        loader: 'babel-loader',
                    },
                },
                {
                    test: /\.(png|jpe?g|gif|svg|ico)$/,
                    use: [
                        {
                            loader: 'url-loader',
                            options: {
                                useRelativePath: true,
                                limit: 10000,
                            },
                        },
                    ],
                },
                {
                    test: /\.html$/,
                    use: [
                        {
                            loader: 'html-loader',
                            options: {
                                minimize: true,
                            },
                        },
                    ],
                },
                {
                    test: /\.(png|svg|jpg|jpeg|gif|ico)$/,
                    exclude: /node_modules/,
                    use: ['file-loader?name=[name].[ext]'],
                },
            ],
        },
        plugins: [
            new CleanWebpackPlugin(),
            new webpack.HotModuleReplacementPlugin(),
            new HtmlWebpackPlugin({
                template: path.resolve(__dirname, './public/index.html'),
                showErrors: true,
                filename: path.join(__dirname, './dist/index.html'),
            }),
        ],
    };

    if (options.mode === 'development') {
        config.devtool = 'inline-source-map';
        config.devServer = {
            hot: true,
            host: '0.0.0.0',
            port: 3000,
            contentBase: path.resolve(__dirname, 'dist'),
            historyApiFallback: true,
            compress: true,
            stats: {
                color: true,
            },
        };
    }

    return config;
};
