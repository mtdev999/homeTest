//
//  Macros.h
//  UITaskOne
//
//  Created by Mark Tezza on 12.09.15.
//  Copyright (c) 2015 Mark Tezza. All rights reserved.
//

#ifndef UITaskOne_Macros_h
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

#define MTStrongifyAndReturnIfNil(var) \
    MTStrongify(var); \
    if (!var) { \
        return; \
    } 


#endif
