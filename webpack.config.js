var ExtractTextPlugin = require('extract-text-webpack-plugin');
var webpack = require("webpack");
var path = require('path');

module.exports = {
  entry: {
    application: path.join(__dirname, 'app', 'javascript', 'application.js'),
  },
  output: {
    filename: 'javascripts/admin_script/[name].js',
    path: path.join(__dirname, 'app', 'assets'),
  },
  module: {
    rules: [
      {
        test: /\.(scss|sass|css)$/i,
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: [
            { loader: 'css-loader', options: { minimize: true } },
          ]
        })
      }
    ]
  },
  resolveLoader: {
    modules: ['node_modules']
  },
  plugins: [
    // new webpack.optimize.UglifyJsPlugin(),
    new ExtractTextPlugin('stylesheets/admin_script/[name].css')
  ],
};
