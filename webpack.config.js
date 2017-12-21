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
        test: /\.(jpg|jpeg|png|gif|svg)$/i,
        loader: 'file-loader',
        options: {
          publicPath: '',
          outputPath: path.join('images', 'admin_script', '/'),
          name: '[name].[ext]',
        }
      }, {
        test: /\.(eot|otf|ttf|woff|woff2)$/i,
        loader: 'file-loader',
        options: {
          publicPath: '',
          outputPath: path.join('fonts', 'admin_script', '/'),
          name: '[name].[ext]',
        }
      }, {
        test: /\.(scss|sass|css)$/i,
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: [
            { loader: 'css-loader', options: { minimize: true } },
            'resolve-url-loader'
          ]
        })
      }
    ]
  },
  resolveLoader: {
    modules: ['node_modules']
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin(),
    new ExtractTextPlugin('stylesheets/admin_script/[name].css'),
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery'
    })
  ],
};
