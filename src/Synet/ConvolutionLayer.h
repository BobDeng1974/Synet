/*
* Synet Framework (http://github.com/ermig1979/Synet).
*
* Copyright (c) 2018-2018 Yermalayeu Ihar.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/

#pragma once

#include "Synet/Common.h"
#include "Synet/Layer.h"

namespace Synet
{
    struct ConvolutionLayerOptions : public LayerOptions
    {
        uint32_t outputNum;
        bool biasTerm;
        uint32_t padX;
        uint32_t padY;
        uint32_t kernelX;
        uint32_t kernelY;
        uint32_t strideX;
        uint32_t strideY;
        uint32_t dilationX;
        uint32_t dilationY;
        uint32_t axis;
        uint32_t group;

        ConvolutionLayerOptions(const String & n)
            : LayerOptions(LayerOptions::ConvolutionLayer, n)
            , biasTerm(true)
            , padX(0)
            , padY(0)
            , kernelX(3)
            , kernelY(3)
            , strideX(1)
            , strideY(1)
            , dilationX(1)
            , dilationY(1)
            , axis(1)
            , group(1)
        {
        }
    };

    template <class T, template<class> class Allocator = std::allocator> class ConvolutionLayer : public Synet::Layer<T, Allocator>
    {
    public:
        typedef T Type;
        typedef Layer<T, Allocator> Base;
        typedef typename Base::Tensor Tensor;
        typedef typename Base::TensorPtrs TensorPtrs;

        ConvolutionLayer(const ConvolutionLayerOptions & options)
            : Base(options)
            , _options(options)
        {
        }

        virtual void Reshape(const TensorPtrs & src, const TensorPtrs & dst);
        virtual void Setup(const TensorPtrs & src, const TensorPtrs & dst);
        virtual inline size_t SrcNum() const { return 1; }
        virtual inline size_t DstMin() const { return 1; }

    protected:
        virtual void ForwardCpu(const TensorPtrs & src, const TensorPtrs & dst);

        virtual bool IsConv() { return true; }

    private:
        ConvolutionLayerOptions _options;

        Shape _srcShape, _kernelShape, _strideShape, _dilationShape, _padShape, _dstShape, _srcConvShape;
        bool _is1x1;
        size_t _spatialAxisNum, _srcChannels, _dstChannels, _srcConvChannels, _dstConvChannels, _weightOffset, _kernelSize;
        size_t _channelAxis, _num, _dstConvSpatialSize, _dstSpatialSize, _colOffset, _dstOffset, _srcSize, _dstSize;
        Tensor _biasMultiplier, _colBuffer;
    };
}