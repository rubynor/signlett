const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

environment.loaders.append('vue', vue)

const resolver = {
    resolve: {
        alias: {
            'vue$': 'vue/dist/vue.esm.js'
        }
    }
}

environment.loaders.append('gql', {
    test: /\.(graphql|gql)$/,
    use: [{
        loader: 'graphql-tag/loader'
    }]
})

environment.loaders.append('vue', {
    test: /\.vue(\.erb)?$/,
    use: [{
        loader: 'vue-loader',
        options: {
            transpileOptions: {
                transforms: {
                    dangerousTaggedTemplateString: true
                }
            }
        }
    }]
})

environment.config.merge(resolver)

module.exports = environment


