var webpack = require("webpack");
var path = require('path');

module.exports = {
  entry: {
    application: path.join(__dirname, 'app', 'javascript', 'application.js')
  },
  output: {
    filename: '[name].js',
    path: path.join(__dirname, 'app', 'assets', 'javascripts', 'admin_script'),
  },
  module: {
    loaders: [
      {
        test: /\.css$/,
        loader: "style!css",
        exclude: /node_modules/
      }, {
        loader: 'sass-loader',
        test: /\.sass$/,
        exclude: /node_modules/,
        options: {
          sourceMap: true
        }
      }, {
        test: /\.(js|jsx)?(\.erb)?$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      }
    ]
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin()
  ],
};
