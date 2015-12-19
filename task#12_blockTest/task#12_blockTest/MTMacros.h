//
//  Macros.h
//  UITaskOne
//
//  Created by Mark Tezza on 12.09.15.
//  Copyright (c) 2015 Mark Tezza. All rights reserved.
//

#define UITaskOne_Macros_h
#define UITaskOne_Macros_h

#define MTDefineBaseViewProperty(propertyName, viewClass) \
    @property (nonatomic, readonly) viewClass   *propertyName;

#define MTBaseViewGetterSynthesize(selector, viewClass) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define MTViewControllerBaseViewProperty(viewControllerClass, propertyName, baseViewClass) \
    @interface viewControllerClass (__##viewClass__##propertyName) \
    MTDefineBaseViewProperty(propertyName, baseViewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__##viewClass__##propertyName) \
    \
    @dynamic propertyName; \
    \
    MTBaseViewGetterSynthesize(propertyName, baseViewClass) \
    \
    @end



#define MTWeakify(var) \
    __weak __typeof(var) __MTWeak_##var = var

#define MTStrongify(var) \
    __strong __typeof(var) var = __MTWeak_##var

#define MTStrongifyAndReturnValueIfNil(var,result) \
    MTStrongify(var); \
    if (!var) { \
        return result; \
    }

#define MTEmpty

#define MTStrongifyAndReturnIfNil(var) \
    MTStrongifyAndReturnValueIfNil(var, MTEmpty)

#define MTStrongifyAndReturnNilIfNil(var) \
    MTStrongifyAndReturnValueIfNil(var, nil)

#define MTLoad(propertyName) \
    [_##propertyName load];

#define __MTSynthesizeObservingSetterWithArgument(propertyName, arg) \
    if (_##propertyName != propertyName) { \
        [_##propertyName removeObserver:self]; \
        _##propertyName = propertyName; \
        [_##propertyName addObserver:self]; \
        arg \
    }

#define MTSynthesizeObservingSetter(propertyName) \
    __MTSynthesizeObservingSetterWithArgument(propertyName, MTEmpty)

#define MTSynthesizeObservingSetterAndLoad(propertyName) \
    __MTSynthesizeObservingSetterWithArgument(propertyName, MTLoad(propertyName))

#define MTMustSleep 1

#if MTMustSleep == 1
    #define MTSleep(time) [NSThread sleepForTimeInterval:time];
#else
    #define MTSleep(time)

#endif
