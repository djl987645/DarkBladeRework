.class public Lcom/kt/olleh/inapp/util/UIParser;
.super Ljava/lang/Object;
.source "UIParser.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "UIParser"


# instance fields
.field private hasResDir:Z

.field private mContext:Landroid/content/Context;

.field private mHash:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mIndex:I

.field private mLayoutStack:Ljava/util/Stack;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-boolean v1, p0, Lcom/kt/olleh/inapp/util/UIParser;->hasResDir:Z

    .line 46
    iput-object p1, p0, Lcom/kt/olleh/inapp/util/UIParser;->mContext:Landroid/content/Context;

    .line 47
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/util/UIParser;->mHash:Ljava/util/Hashtable;

    .line 48
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/util/UIParser;->mLayoutStack:Ljava/util/Stack;

    .line 49
    iput v1, p0, Lcom/kt/olleh/inapp/util/UIParser;->mIndex:I

    .line 50
    return-void
.end method

.method private createView(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;
    .locals 38
    .param p1, "parse"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 172
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v21

    .line 173
    .local v21, "name":Ljava/lang/String;
    const/16 v23, 0x0

    .line 174
    .local v23, "result":Landroid/view/View;
    invoke-static/range {p1 .. p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v3

    .line 176
    .local v3, "atts":Landroid/util/AttributeSet;
    const-string v34, "LinearLayout"

    move-object/from16 v0, v21

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_1

    .line 177
    new-instance v23, Landroid/widget/LinearLayout;

    .end local v23    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kt/olleh/inapp/util/UIParser;->mContext:Landroid/content/Context;

    move-object/from16 v34, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v34

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 189
    .restart local v23    # "result":Landroid/view/View;
    :goto_0
    if-nez v23, :cond_6

    .line 190
    const/16 v23, 0x0

    .line 432
    .end local v23    # "result":Landroid/view/View;
    :cond_0
    :goto_1
    return-object v23

    .line 178
    .restart local v23    # "result":Landroid/view/View;
    :cond_1
    const-string v34, "TextView"

    move-object/from16 v0, v21

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_2

    .line 179
    new-instance v23, Landroid/widget/TextView;

    .end local v23    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kt/olleh/inapp/util/UIParser;->mContext:Landroid/content/Context;

    move-object/from16 v34, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v34

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .restart local v23    # "result":Landroid/view/View;
    goto :goto_0

    .line 180
    :cond_2
    const-string v34, "ImageView"

    move-object/from16 v0, v21

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_3

    .line 181
    new-instance v23, Landroid/widget/ImageView;

    .end local v23    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kt/olleh/inapp/util/UIParser;->mContext:Landroid/content/Context;

    move-object/from16 v34, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v34

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .restart local v23    # "result":Landroid/view/View;
    goto :goto_0

    .line 182
    :cond_3
    const-string v34, "Button"

    move-object/from16 v0, v21

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_4

    .line 183
    new-instance v23, Landroid/widget/Button;

    .end local v23    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kt/olleh/inapp/util/UIParser;->mContext:Landroid/content/Context;

    move-object/from16 v34, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v34

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .restart local v23    # "result":Landroid/view/View;
    goto :goto_0

    .line 184
    :cond_4
    const-string v34, "EditText"

    move-object/from16 v0, v21

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_5

    .line 185
    new-instance v23, Landroid/widget/EditText;

    .end local v23    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kt/olleh/inapp/util/UIParser;->mContext:Landroid/content/Context;

    move-object/from16 v34, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v34

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .restart local v23    # "result":Landroid/view/View;
    goto :goto_0

    .line 187
    :cond_5
    new-instance v34, Ljava/lang/StringBuilder;

    const-string v35, "Unhandled tag:"

    invoke-direct/range {v34 .. v35}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v34 .. v34}, Ljunit/framework/Assert;->fail(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 192
    :cond_6
    const-string v34, "android:id"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 193
    .local v12, "id":Ljava/lang/String;
    if-eqz v12, :cond_7

    .line 194
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v12}, Lcom/kt/olleh/inapp/util/UIParser;->setID(Landroid/view/View;Ljava/lang/String;)V

    .line 196
    :cond_7
    const-string v34, "android:background"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 197
    .local v13, "image":Ljava/lang/String;
    if-eqz v13, :cond_8

    .line 199
    const-string v34, "#"

    move-object/from16 v0, v34

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v34

    if-eqz v34, :cond_c

    .line 201
    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v34

    move-object/from16 v0, v23

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 249
    :cond_8
    :goto_2
    const-string v34, "android:visibility"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 250
    .local v33, "visible":Ljava/lang/String;
    if-eqz v33, :cond_9

    .line 252
    const-string v34, "gone"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_f

    .line 253
    const/16 v34, 0x8

    move-object/from16 v0, v23

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 260
    :cond_9
    :goto_3
    move-object/from16 v0, v23

    instance-of v0, v0, Landroid/widget/LinearLayout;

    move/from16 v34, v0

    if-eqz v34, :cond_13

    move-object/from16 v19, v23

    .line 262
    check-cast v19, Landroid/widget/LinearLayout;

    .line 263
    .local v19, "ll":Landroid/widget/LinearLayout;
    const-string v34, "android:orientation"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 264
    .local v22, "orient":Ljava/lang/String;
    if-eqz v22, :cond_a

    .line 266
    const-string v34, "horizontal"

    move-object/from16 v0, v22

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_11

    .line 267
    const/16 v34, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 272
    :cond_a
    :goto_4
    const-string v34, "android:gravity"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 273
    .local v11, "gravity":Ljava/lang/String;
    if-eqz v11, :cond_b

    .line 275
    const-string v34, "center"

    move-object/from16 v0, v34

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_12

    .line 276
    const/16 v34, 0x11

    move-object/from16 v0, v19

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 427
    .end local v11    # "gravity":Ljava/lang/String;
    .end local v19    # "ll":Landroid/widget/LinearLayout;
    .end local v22    # "orient":Ljava/lang/String;
    :cond_b
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kt/olleh/inapp/util/UIParser;->mLayoutStack:Ljava/util/Stack;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Ljava/util/Stack;->size()I

    move-result v34

    if-lez v34, :cond_0

    .line 429
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v3}, Lcom/kt/olleh/inapp/util/UIParser;->setPadding(Landroid/view/View;Landroid/util/AttributeSet;)V

    .line 430
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kt/olleh/inapp/util/UIParser;->mLayoutStack:Ljava/util/Stack;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->loadLayoutParams(Landroid/util/AttributeSet;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v34

    move-object/from16 v0, v23

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_1

    .line 205
    .end local v33    # "visible":Ljava/lang/String;
    :cond_c
    move-object/from16 v0, v23

    instance-of v0, v0, Landroid/widget/EditText;

    move/from16 v34, v0

    if-eqz v34, :cond_d

    move-object/from16 v8, v23

    .line 207
    check-cast v8, Landroid/widget/EditText;

    .line 209
    .local v8, "btn":Landroid/widget/EditText;
    new-instance v10, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v10}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 211
    .local v10, "drawables":Landroid/graphics/drawable/StateListDrawable;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v34

    new-instance v35, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/util/UIParser;->getResourcePath()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v36, "a_inputbox_p.png"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v15

    .line 212
    .local v15, "in":Ljava/io/InputStream;
    const-string v34, "a_inputbox_p"

    move-object/from16 v0, v34

    invoke-static {v15, v0}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 213
    .local v7, "btPress":Landroid/graphics/drawable/Drawable;
    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [I

    move-object/from16 v34, v0

    const/16 v35, 0x0

    const v36, 0x10100a7

    aput v36, v34, v35

    move-object/from16 v0, v34

    invoke-virtual {v10, v0, v7}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 215
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v34

    new-instance v35, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/util/UIParser;->getResourcePath()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v36, "a_inputbox_f.png"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v15

    .line 216
    const-string v34, "a_inputbox_f"

    move-object/from16 v0, v34

    invoke-static {v15, v0}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 217
    .local v4, "btFocus":Landroid/graphics/drawable/Drawable;
    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [I

    move-object/from16 v34, v0

    const/16 v35, 0x0

    const v36, 0x101009c

    aput v36, v34, v35

    move-object/from16 v0, v34

    invoke-virtual {v10, v0, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 219
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v34

    new-instance v35, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/util/UIParser;->getResourcePath()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v36, "a_inputbox_n.png"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v15

    .line 220
    const-string v34, "a_inputbox_n"

    move-object/from16 v0, v34

    invoke-static {v15, v0}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 221
    .local v5, "btOn":Landroid/graphics/drawable/Drawable;
    const/16 v34, 0x0

    move/from16 v0, v34

    new-array v0, v0, [I

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    invoke-virtual {v10, v0, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 223
    invoke-virtual {v8, v10}, Landroid/widget/EditText;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 225
    .end local v4    # "btFocus":Landroid/graphics/drawable/Drawable;
    .end local v5    # "btOn":Landroid/graphics/drawable/Drawable;
    .end local v7    # "btPress":Landroid/graphics/drawable/Drawable;
    .end local v8    # "btn":Landroid/widget/EditText;
    .end local v10    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    .end local v15    # "in":Ljava/io/InputStream;
    :cond_d
    move-object/from16 v0, v23

    instance-of v0, v0, Landroid/widget/Button;

    move/from16 v34, v0

    if-eqz v34, :cond_e

    move-object/from16 v8, v23

    .line 227
    check-cast v8, Landroid/widget/Button;

    .line 229
    .local v8, "btn":Landroid/widget/Button;
    new-instance v10, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v10}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 231
    .restart local v10    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v34

    new-instance v35, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/util/UIParser;->getResourcePath()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v36, "popup_btn_sel.png"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v15

    .line 232
    .restart local v15    # "in":Ljava/io/InputStream;
    const-string v34, "popup_btn_sel"

    move-object/from16 v0, v34

    invoke-static {v15, v0}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 233
    .local v6, "btOver":Landroid/graphics/drawable/Drawable;
    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [I

    move-object/from16 v34, v0

    const/16 v35, 0x0

    const v36, 0x10100a7

    aput v36, v34, v35

    move-object/from16 v0, v34

    invoke-virtual {v10, v0, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 235
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v34

    new-instance v35, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/util/UIParser;->getResourcePath()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v36, "popup_btn.png"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v15

    .line 236
    const-string v34, "popup_btn"

    move-object/from16 v0, v34

    invoke-static {v15, v0}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 237
    .restart local v5    # "btOn":Landroid/graphics/drawable/Drawable;
    const/16 v34, 0x0

    move/from16 v0, v34

    new-array v0, v0, [I

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    invoke-virtual {v10, v0, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 239
    invoke-virtual {v8, v10}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 243
    .end local v5    # "btOn":Landroid/graphics/drawable/Drawable;
    .end local v6    # "btOver":Landroid/graphics/drawable/Drawable;
    .end local v8    # "btn":Landroid/widget/Button;
    .end local v10    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    .end local v15    # "in":Ljava/io/InputStream;
    :cond_e
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/kt/olleh/inapp/util/UIParser;->openFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v17

    .line 244
    .local v17, "is":Ljava/io/InputStream;
    move-object/from16 v0, v17

    invoke-static {v0, v13}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v34

    move-object/from16 v0, v23

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 254
    .end local v17    # "is":Ljava/io/InputStream;
    .restart local v33    # "visible":Ljava/lang/String;
    :cond_f
    const-string v34, "visible"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_10

    .line 255
    const/16 v34, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_3

    .line 256
    :cond_10
    const-string v34, "invisible"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_9

    .line 257
    const/16 v34, 0x4

    move-object/from16 v0, v23

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_3

    .line 268
    .restart local v19    # "ll":Landroid/widget/LinearLayout;
    .restart local v22    # "orient":Ljava/lang/String;
    :cond_11
    const-string v34, "vertical"

    move-object/from16 v0, v22

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_a

    .line 269
    const/16 v34, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    goto/16 :goto_4

    .line 278
    .restart local v11    # "gravity":Ljava/lang/String;
    :cond_12
    const/16 v34, 0x5

    move-object/from16 v0, v19

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto/16 :goto_5

    .line 281
    .end local v11    # "gravity":Ljava/lang/String;
    .end local v19    # "ll":Landroid/widget/LinearLayout;
    .end local v22    # "orient":Ljava/lang/String;
    :cond_13
    move-object/from16 v0, v23

    instance-of v0, v0, Landroid/widget/EditText;

    move/from16 v34, v0

    if-eqz v34, :cond_1c

    move-object/from16 v32, v23

    .line 283
    check-cast v32, Landroid/widget/EditText;

    .line 284
    .local v32, "tv":Landroid/widget/EditText;
    const-string v34, "android:text"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 285
    .local v26, "text":Ljava/lang/String;
    const-string v34, "android:textSize"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 286
    .local v31, "textSize":Ljava/lang/String;
    const-string v34, "android:textColor"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 287
    .local v27, "textColor":Ljava/lang/String;
    const-string v34, "android:gravity"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 288
    .local v29, "textGravity":Ljava/lang/String;
    if-eqz v26, :cond_14

    .line 290
    const-string v34, "\\n"

    const-string v35, "\n"

    move-object/from16 v0, v26

    move-object/from16 v1, v34

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v26

    .line 291
    move-object/from16 v0, v32

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 294
    :cond_14
    if-eqz v31, :cond_15

    .line 295
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/kt/olleh/inapp/util/UIParser;->readSize(Ljava/lang/String;)I

    move-result v34

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 297
    :cond_15
    if-eqz v27, :cond_16

    .line 298
    invoke-static/range {v27 .. v27}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v34

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 300
    :cond_16
    if-eqz v29, :cond_1a

    .line 301
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v2}, Lcom/kt/olleh/inapp/util/UIParser;->setGravity(Landroid/view/View;Ljava/lang/String;)I

    .line 305
    :goto_6
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-direct {v0, v1, v3}, Lcom/kt/olleh/inapp/util/UIParser;->setPadding(Landroid/view/View;Landroid/util/AttributeSet;)V

    .line 307
    const-string v34, "android:maxLines"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 308
    .local v20, "maxLines":Ljava/lang/String;
    if-eqz v20, :cond_17

    .line 309
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/kt/olleh/inapp/util/UIParser;->readInt(Ljava/lang/String;)I

    move-result v34

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 311
    :cond_17
    const-string v34, "android:singleLine"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 312
    .local v24, "singeline":Ljava/lang/String;
    if-eqz v24, :cond_18

    const-string v34, "true"

    move-object/from16 v0, v24

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_18

    .line 313
    const/16 v34, 0x1

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 315
    :cond_18
    const-string v34, "android:imeOptions"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 316
    .local v14, "imeOptions":Ljava/lang/String;
    if-eqz v14, :cond_19

    .line 318
    const-string v34, "actionNext"

    move-object/from16 v0, v34

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_1b

    .line 319
    const/16 v34, 0x5

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 324
    :cond_19
    :goto_7
    const-string v34, "android:inputType"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 325
    .local v16, "inputType":Ljava/lang/String;
    if-eqz v16, :cond_b

    .line 327
    const/16 v34, 0x81

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    goto/16 :goto_5

    .line 303
    .end local v14    # "imeOptions":Ljava/lang/String;
    .end local v16    # "inputType":Ljava/lang/String;
    .end local v20    # "maxLines":Ljava/lang/String;
    .end local v24    # "singeline":Ljava/lang/String;
    :cond_1a
    const/16 v34, 0x13

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setGravity(I)V

    goto/16 :goto_6

    .line 321
    .restart local v14    # "imeOptions":Ljava/lang/String;
    .restart local v20    # "maxLines":Ljava/lang/String;
    .restart local v24    # "singeline":Ljava/lang/String;
    :cond_1b
    const/16 v34, 0x6

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    goto :goto_7

    .line 330
    .end local v14    # "imeOptions":Ljava/lang/String;
    .end local v20    # "maxLines":Ljava/lang/String;
    .end local v24    # "singeline":Ljava/lang/String;
    .end local v26    # "text":Ljava/lang/String;
    .end local v27    # "textColor":Ljava/lang/String;
    .end local v29    # "textGravity":Ljava/lang/String;
    .end local v31    # "textSize":Ljava/lang/String;
    .end local v32    # "tv":Landroid/widget/EditText;
    :cond_1c
    move-object/from16 v0, v23

    instance-of v0, v0, Landroid/widget/TextView;

    move/from16 v34, v0

    if-eqz v34, :cond_26

    move-object/from16 v32, v23

    .line 332
    check-cast v32, Landroid/widget/TextView;

    .line 333
    .local v32, "tv":Landroid/widget/TextView;
    const-string v34, "android:text"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 334
    .restart local v26    # "text":Ljava/lang/String;
    const-string v34, "android:textSize"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 335
    .restart local v31    # "textSize":Ljava/lang/String;
    const-string v34, "android:textColor"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 336
    .restart local v27    # "textColor":Ljava/lang/String;
    const-string v34, "android:gravity"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 337
    .restart local v29    # "textGravity":Ljava/lang/String;
    const-string v34, "android:ellipsize"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 338
    .local v28, "textEllipsize":Ljava/lang/String;
    const-string v34, "android:singleLine"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 340
    .local v30, "textSingleLine":Ljava/lang/String;
    if-eqz v26, :cond_1d

    .line 342
    const-string v34, "\\n"

    const-string v35, "\n"

    move-object/from16 v0, v26

    move-object/from16 v1, v34

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v26

    .line 343
    move-object/from16 v0, v32

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 346
    :cond_1d
    if-eqz v30, :cond_1e

    .line 348
    const-string v34, "true"

    move-object/from16 v0, v30

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_22

    .line 350
    const/16 v34, 0x1

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 358
    :cond_1e
    :goto_8
    if-eqz v28, :cond_1f

    .line 360
    const-string v34, "end"

    move-object/from16 v0, v28

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_23

    .line 361
    sget-object v34, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    move-object/from16 v0, v32

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 366
    :cond_1f
    :goto_9
    if-eqz v31, :cond_20

    .line 367
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/kt/olleh/inapp/util/UIParser;->readSize(Ljava/lang/String;)I

    move-result v34

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 369
    :cond_20
    if-eqz v27, :cond_21

    .line 371
    const-string v34, "#"

    move-object/from16 v0, v27

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v34

    if-eqz v34, :cond_24

    .line 372
    invoke-static/range {v27 .. v27}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v34

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 398
    :cond_21
    :goto_a
    if-eqz v29, :cond_25

    .line 399
    const/16 v34, 0x11

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 402
    :goto_b
    const/16 v34, 0x0

    const v35, 0x3f933333    # 1.15f

    move-object/from16 v0, v32

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setLineSpacing(FF)V

    goto/16 :goto_5

    .line 354
    :cond_22
    const/16 v34, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    goto :goto_8

    .line 362
    :cond_23
    const-string v34, "marque"

    move-object/from16 v0, v28

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_1f

    .line 363
    sget-object v34, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    move-object/from16 v0, v32

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_9

    .line 375
    :cond_24
    const/16 v34, 0x2

    move/from16 v0, v34

    new-array v0, v0, [[I

    move-object/from16 v25, v0

    const/16 v34, 0x0

    const/16 v35, 0x1

    move/from16 v0, v35

    new-array v0, v0, [I

    move-object/from16 v35, v0

    const/16 v36, 0x0

    const v37, 0x10100a7

    aput v37, v35, v36

    aput-object v35, v25, v34

    const/16 v34, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    new-array v0, v0, [I

    move-object/from16 v35, v0

    aput-object v35, v25, v34

    .line 377
    .local v25, "stateList":[[I
    const/16 v34, 0x2

    move/from16 v0, v34

    new-array v9, v0, [I

    const/16 v34, 0x0

    const-string v35, "#FFFFFF"

    invoke-static/range {v35 .. v35}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v35

    aput v35, v9, v34

    const/16 v34, 0x1

    const-string v35, "#171717"

    invoke-static/range {v35 .. v35}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v35

    aput v35, v9, v34

    .line 379
    .local v9, "colors":[I
    new-instance v18, Landroid/content/res/ColorStateList;

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v9}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 381
    .local v18, "list":Landroid/content/res/ColorStateList;
    const/16 v34, 0x1

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setClickable(Z)V

    .line 382
    move-object/from16 v0, v32

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 384
    new-instance v10, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v10}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 386
    .restart local v10    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v34

    new-instance v35, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/util/UIParser;->getResourcePath()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v36, "e_popup_list_p.png"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v15

    .line 387
    .restart local v15    # "in":Ljava/io/InputStream;
    const-string v34, "e_popup_list_bg"

    move-object/from16 v0, v34

    invoke-static {v15, v0}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 388
    .restart local v6    # "btOver":Landroid/graphics/drawable/Drawable;
    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [I

    move-object/from16 v34, v0

    const/16 v35, 0x0

    const v36, 0x10100a7

    aput v36, v34, v35

    move-object/from16 v0, v34

    invoke-virtual {v10, v0, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 390
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v34

    new-instance v35, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/kt/olleh/inapp/util/UIParser;->getResourcePath()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v36, "e_popup_list_bg.png"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v15

    .line 391
    const-string v34, "e_popup_list_bg"

    move-object/from16 v0, v34

    invoke-static {v15, v0}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 392
    .restart local v5    # "btOn":Landroid/graphics/drawable/Drawable;
    const/16 v34, 0x0

    move/from16 v0, v34

    new-array v0, v0, [I

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    invoke-virtual {v10, v0, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 394
    move-object/from16 v0, v32

    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_a

    .line 401
    .end local v5    # "btOn":Landroid/graphics/drawable/Drawable;
    .end local v6    # "btOver":Landroid/graphics/drawable/Drawable;
    .end local v9    # "colors":[I
    .end local v10    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    .end local v15    # "in":Ljava/io/InputStream;
    .end local v18    # "list":Landroid/content/res/ColorStateList;
    .end local v25    # "stateList":[[I
    :cond_25
    const/16 v34, 0x13

    move-object/from16 v0, v32

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    goto/16 :goto_b

    .line 404
    .end local v26    # "text":Ljava/lang/String;
    .end local v27    # "textColor":Ljava/lang/String;
    .end local v28    # "textEllipsize":Ljava/lang/String;
    .end local v29    # "textGravity":Ljava/lang/String;
    .end local v30    # "textSingleLine":Ljava/lang/String;
    .end local v31    # "textSize":Ljava/lang/String;
    .end local v32    # "tv":Landroid/widget/TextView;
    :cond_26
    move-object/from16 v0, v23

    instance-of v0, v0, Landroid/widget/Button;

    move/from16 v34, v0

    if-eqz v34, :cond_b

    move-object/from16 v8, v23

    .line 406
    check-cast v8, Landroid/widget/Button;

    .line 408
    .restart local v8    # "btn":Landroid/widget/Button;
    const-string v34, "android:gravity"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 409
    .restart local v11    # "gravity":Ljava/lang/String;
    if-eqz v11, :cond_27

    .line 411
    const-string v34, "center"

    move-object/from16 v0, v34

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_29

    .line 412
    const/16 v34, 0x11

    move/from16 v0, v34

    invoke-virtual {v8, v0}, Landroid/widget/Button;->setGravity(I)V

    .line 417
    :cond_27
    :goto_c
    const-string v34, "android:textSize"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 418
    .restart local v31    # "textSize":Ljava/lang/String;
    if-eqz v31, :cond_28

    .line 419
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/kt/olleh/inapp/util/UIParser;->readSize(Ljava/lang/String;)I

    move-result v34

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    move/from16 v0, v34

    invoke-virtual {v8, v0}, Landroid/widget/Button;->setTextSize(F)V

    .line 421
    :cond_28
    const-string v34, "android:textColor"

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v3, v1}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 422
    .restart local v27    # "textColor":Ljava/lang/String;
    if-eqz v27, :cond_b

    .line 423
    invoke-static/range {v27 .. v27}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v34

    move/from16 v0, v34

    invoke-virtual {v8, v0}, Landroid/widget/Button;->setTextColor(I)V

    goto/16 :goto_5

    .line 414
    .end local v27    # "textColor":Ljava/lang/String;
    .end local v31    # "textSize":Ljava/lang/String;
    :cond_29
    const/16 v34, 0x5

    move/from16 v0, v34

    invoke-virtual {v8, v0}, Landroid/widget/Button;->setGravity(I)V

    goto :goto_c
.end method

.method private dipToInt(F)I
    .locals 3
    .param p1, "number"    # F

    .prologue
    .line 677
    const/4 v1, 0x0

    cmpl-float v1, p1, v1

    if-nez v1, :cond_0

    .line 679
    const/4 v0, 0x0

    .line 683
    :goto_0
    return v0

    .line 682
    :cond_0
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/kt/olleh/inapp/util/UIParser;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v1, p1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v0, v1

    .line 683
    .local v0, "num":I
    goto :goto_0
.end method

.method private findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "atts"    # Landroid/util/AttributeSet;
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    .line 549
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Landroid/util/AttributeSet;->getAttributeCount()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 553
    const-string v2, ":"

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 554
    .local v1, "ix":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 555
    const-string v2, "http://schemas.android.com/apk/res/android"

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 557
    .end local v1    # "ix":I
    :goto_1
    return-object v2

    .line 550
    :cond_0
    invoke-interface {p1, v0}, Landroid/util/AttributeSet;->getAttributeName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 551
    invoke-interface {p1, v0}, Landroid/util/AttributeSet;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 549
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 557
    .restart local v1    # "ix":I
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private findPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 729
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/kt/olleh/inapp/util/UIParser;->findPath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private findPath(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "bNine"    # Z

    .prologue
    const/4 v3, 0x1

    .line 706
    if-nez p1, :cond_1

    .line 707
    const/4 p1, 0x0

    .line 724
    .end local p1    # "value":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 709
    .restart local p1    # "value":Ljava/lang/String;
    :cond_1
    const-string v1, "@drawable/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 711
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 712
    .local v0, "split":[Ljava/lang/String;
    if-eqz v0, :cond_0

    array-length v1, v0

    if-le v1, v3, :cond_0

    .line 714
    if-eqz p2, :cond_2

    .line 715
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/util/UIParser;->getResourcePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".9.png"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 717
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/util/UIParser;->getResourcePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".png"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private inflate(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;
    .locals 6
    .param p1, "parse"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    iget-object v4, p0, Lcom/kt/olleh/inapp/util/UIParser;->mLayoutStack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->clear()V

    .line 117
    iget-object v4, p0, Lcom/kt/olleh/inapp/util/UIParser;->mHash:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->clear()V

    .line 118
    const/4 v4, 0x0

    iput v4, p0, Lcom/kt/olleh/inapp/util/UIParser;->mIndex:I

    .line 120
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 121
    .local v0, "data":Ljava/util/Stack;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    .line 122
    .local v1, "evt":I
    const/4 v2, 0x0

    .line 123
    .local v2, "root":Landroid/view/View;
    :cond_0
    :goto_0
    const/4 v4, 0x1

    if-ne v1, v4, :cond_1

    .line 162
    return-object v2

    .line 125
    :cond_1
    packed-switch v1, :pswitch_data_0

    .line 160
    :cond_2
    :goto_1
    :pswitch_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    goto :goto_0

    .line 132
    :pswitch_1
    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    goto :goto_1

    .line 136
    :pswitch_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    invoke-direct {p0, p1}, Lcom/kt/olleh/inapp/util/UIParser;->createView(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;

    move-result-object v3

    .line 138
    .local v3, "v":Landroid/view/View;
    if-eqz v3, :cond_0

    .line 140
    if-nez v2, :cond_3

    .line 141
    move-object v2, v3

    .line 144
    :goto_2
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_2

    .line 145
    iget-object v4, p0, Lcom/kt/olleh/inapp/util/UIParser;->mLayoutStack:Ljava/util/Stack;

    check-cast v3, Landroid/view/ViewGroup;

    .end local v3    # "v":Landroid/view/View;
    invoke-virtual {v4, v3}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 143
    .restart local v3    # "v":Landroid/view/View;
    :cond_3
    iget-object v4, p0, Lcom/kt/olleh/inapp/util/UIParser;->mLayoutStack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_2

    .line 151
    .end local v3    # "v":Landroid/view/View;
    :pswitch_3
    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/StringBuffer;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 155
    :pswitch_4
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 156
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/kt/olleh/inapp/util/UIParser;->isLayout(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 157
    iget-object v4, p0, Lcom/kt/olleh/inapp/util/UIParser;->mLayoutStack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_1

    .line 125
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method private isLayout(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 167
    const-string v0, "Layout"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private loadLayoutParams(Landroid/util/AttributeSet;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;
    .locals 13
    .param p1, "atts"    # Landroid/util/AttributeSet;
    .param p2, "vg"    # Landroid/view/ViewGroup;

    .prologue
    .line 562
    const/4 v4, 0x0

    .line 563
    .local v4, "lps":Landroid/view/ViewGroup$LayoutParams;
    const-string v12, "android:layout_width"

    invoke-direct {p0, p1, v12}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 564
    .local v11, "width":Ljava/lang/String;
    const-string v12, "android:layout_height"

    invoke-direct {p0, p1, v12}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 565
    .local v2, "height":Ljava/lang/String;
    invoke-direct {p0, v11}, Lcom/kt/olleh/inapp/util/UIParser;->readSize(Ljava/lang/String;)I

    move-result v9

    .line 566
    .local v9, "w":I
    invoke-direct {p0, v2}, Lcom/kt/olleh/inapp/util/UIParser;->readSize(Ljava/lang/String;)I

    move-result v1

    .line 568
    .local v1, "h":I
    instance-of v12, p2, Landroid/widget/LinearLayout;

    if-eqz v12, :cond_0

    .line 569
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .end local v4    # "lps":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v4, v9, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 571
    .restart local v4    # "lps":Landroid/view/ViewGroup$LayoutParams;
    :cond_0
    instance-of v12, v4, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v12, :cond_7

    move-object v3, v4

    .line 573
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 574
    .local v3, "l":Landroid/widget/LinearLayout$LayoutParams;
    const-string v12, "android:layout_gravity"

    invoke-direct {p0, p1, v12}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 575
    .local v0, "gravity":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 577
    const-string v12, "center"

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 578
    const/16 v12, 0x11

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 583
    :cond_1
    :goto_0
    const-string v12, "android:layout_weight"

    invoke-direct {p0, p1, v12}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 584
    .local v10, "weight":Ljava/lang/String;
    if-eqz v10, :cond_2

    .line 585
    invoke-static {v10}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v12

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 586
    :cond_2
    const-string v12, "android:layout_marginTop"

    invoke-direct {p0, p1, v12}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 587
    .local v8, "marginTop":Ljava/lang/String;
    const-string v12, "android:layout_marginLeft"

    invoke-direct {p0, p1, v12}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 588
    .local v6, "marginLeft":Ljava/lang/String;
    const-string v12, "android:layout_marginRight"

    invoke-direct {p0, p1, v12}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 589
    .local v7, "marginRight":Ljava/lang/String;
    const-string v12, "android:layout_marginBottom"

    invoke-direct {p0, p1, v12}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 590
    .local v5, "marginBottom":Ljava/lang/String;
    if-eqz v8, :cond_3

    .line 591
    invoke-direct {p0, v8}, Lcom/kt/olleh/inapp/util/UIParser;->readDPSize(Ljava/lang/String;)I

    move-result v12

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 592
    :cond_3
    if-eqz v6, :cond_4

    .line 593
    invoke-direct {p0, v6}, Lcom/kt/olleh/inapp/util/UIParser;->readDPSize(Ljava/lang/String;)I

    move-result v12

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 594
    :cond_4
    if-eqz v7, :cond_5

    .line 595
    invoke-direct {p0, v7}, Lcom/kt/olleh/inapp/util/UIParser;->readDPSize(Ljava/lang/String;)I

    move-result v12

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 596
    :cond_5
    if-eqz v5, :cond_6

    .line 597
    invoke-direct {p0, v5}, Lcom/kt/olleh/inapp/util/UIParser;->readDPSize(Ljava/lang/String;)I

    move-result v12

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 598
    :cond_6
    move-object v4, v3

    .line 600
    .end local v0    # "gravity":Ljava/lang/String;
    .end local v3    # "l":Landroid/widget/LinearLayout$LayoutParams;
    .end local v5    # "marginBottom":Ljava/lang/String;
    .end local v6    # "marginLeft":Ljava/lang/String;
    .end local v7    # "marginRight":Ljava/lang/String;
    .end local v8    # "marginTop":Ljava/lang/String;
    .end local v10    # "weight":Ljava/lang/String;
    :cond_7
    return-object v4

    .line 580
    .restart local v0    # "gravity":Ljava/lang/String;
    .restart local v3    # "l":Landroid/widget/LinearLayout$LayoutParams;
    :cond_8
    const/4 v12, 0x5

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    goto :goto_0
.end method

.method private openFile(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 734
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/kt/olleh/inapp/util/UIParser;->findPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 735
    .local v0, "is":Ljava/io/InputStream;
    if-nez v0, :cond_0

    .line 737
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, p1, v2}, Lcom/kt/olleh/inapp/util/UIParser;->findPath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 740
    .end local v0    # "is":Ljava/io/InputStream;
    :cond_0
    return-object v0
.end method

.method private readDPSize(Ljava/lang/String;)I
    .locals 4
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 659
    const/4 v1, 0x0

    .line 662
    .local v1, "size":F
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    const-string v2, "dip"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 664
    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x3

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    .line 665
    invoke-direct {p0, v1}, Lcom/kt/olleh/inapp/util/UIParser;->dipToInt(F)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 672
    :goto_0
    return v2

    .line 668
    :catch_0
    move-exception v0

    .line 670
    .local v0, "ex":Ljava/lang/NumberFormatException;
    const/4 v2, -0x1

    goto :goto_0

    .line 672
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_0
.end method

.method private readFontSize(Ljava/lang/String;)I
    .locals 7
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 637
    const/4 v2, 0x0

    .line 642
    .local v2, "size":F
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x3

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 648
    float-to-double v3, v2

    const-wide/high16 v5, 0x3ff8000000000000L    # 1.5

    div-double/2addr v3, v5

    double-to-float v0, v3

    .line 649
    .local v0, "dpChange":F
    float-to-int v3, v0

    .end local v0    # "dpChange":F
    :goto_0
    return v3

    .line 644
    :catch_0
    move-exception v1

    .line 646
    .local v1, "ex":Ljava/lang/NumberFormatException;
    const/4 v3, -0x1

    goto :goto_0
.end method

.method private readInt(Ljava/lang/String;)I
    .locals 4
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 689
    const/4 v1, 0x0

    .line 692
    .local v1, "size":I
    if-eqz p1, :cond_0

    .line 694
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 701
    :cond_0
    :goto_0
    return v1

    .line 697
    :catch_0
    move-exception v0

    .line 699
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v2, "UIParser"

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private readSize(Ljava/lang/String;)I
    .locals 8
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    const/4 v4, -0x1

    .line 605
    const/high16 v0, 0x3f800000    # 1.0f

    .line 606
    .local v0, "density":F
    const-string v5, "wrap_content"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 607
    const/4 v4, -0x2

    .line 632
    :cond_0
    :goto_0
    return v4

    .line 608
    :cond_1
    const-string v5, "fill_parent"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 615
    const/4 v3, 0x0

    .line 616
    .local v3, "size":F
    if-eqz p1, :cond_2

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x3

    if-le v5, v6, :cond_2

    const-string v5, "dip"

    invoke-virtual {p1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 618
    const/4 v5, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x3

    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    .line 619
    invoke-direct {p0, v3}, Lcom/kt/olleh/inapp/util/UIParser;->dipToInt(F)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    goto :goto_0

    .line 622
    :catch_0
    move-exception v2

    .line 624
    .local v2, "ex":Ljava/lang/NumberFormatException;
    goto :goto_0

    .line 626
    .end local v2    # "ex":Ljava/lang/NumberFormatException;
    :cond_2
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    if-le v4, v5, :cond_3

    const-string v4, "pt"

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 628
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    .line 629
    float-to-double v4, v3

    const-wide/high16 v6, 0x3ff8000000000000L    # 1.5

    div-double/2addr v4, v6

    double-to-float v1, v4

    .line 630
    .local v1, "dpChange":F
    mul-float v4, v1, v0

    float-to-int v4, v4

    goto :goto_0

    .line 632
    .end local v1    # "dpChange":F
    :cond_3
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    goto :goto_0
.end method

.method private setGravity(Landroid/view/View;Ljava/lang/String;)I
    .locals 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "layoutGravity"    # Ljava/lang/String;

    .prologue
    .line 437
    if-eqz p2, :cond_d

    .line 439
    const-string v3, "|"

    invoke-virtual {p2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 440
    .local v2, "split":[Ljava/lang/String;
    const/4 v0, 0x0

    .line 441
    .local v0, "gravity":I
    if-eqz v2, :cond_d

    .line 443
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-lt v1, v3, :cond_0

    .line 499
    .end local v0    # "gravity":I
    .end local v1    # "i":I
    .end local v2    # "split":[Ljava/lang/String;
    :goto_1
    return v0

    .line 445
    .restart local v0    # "gravity":I
    .restart local v1    # "i":I
    .restart local v2    # "split":[Ljava/lang/String;
    :cond_0
    aget-object v3, v2, v1

    const-string v4, "top"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 447
    or-int/lit8 v0, v0, 0x30

    .line 443
    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 449
    :cond_2
    aget-object v3, v2, v1

    const-string v4, "bottom"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 451
    or-int/lit8 v0, v0, 0x50

    goto :goto_2

    .line 453
    :cond_3
    aget-object v3, v2, v1

    const-string v4, "left"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 455
    or-int/lit8 v0, v0, 0x3

    goto :goto_2

    .line 457
    :cond_4
    aget-object v3, v2, v1

    const-string v4, "right"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 459
    or-int/lit8 v0, v0, 0x5

    goto :goto_2

    .line 461
    :cond_5
    aget-object v3, v2, v1

    const-string v4, "center_vertical"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 463
    or-int/lit8 v0, v0, 0x10

    goto :goto_2

    .line 465
    :cond_6
    aget-object v3, v2, v1

    const-string v4, "fill_vertical"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 467
    or-int/lit8 v0, v0, 0x70

    goto :goto_2

    .line 469
    :cond_7
    aget-object v3, v2, v1

    const-string v4, "center_horizontal"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 471
    or-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 473
    :cond_8
    aget-object v3, v2, v1

    const-string v4, "fill_horizontal"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 475
    or-int/lit8 v0, v0, 0x7

    goto :goto_2

    .line 477
    :cond_9
    aget-object v3, v2, v1

    const-string v4, "center"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 479
    or-int/lit8 v0, v0, 0x11

    goto :goto_2

    .line 481
    :cond_a
    aget-object v3, v2, v1

    const-string v4, "fill"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 483
    or-int/lit8 v0, v0, 0x77

    goto :goto_2

    .line 485
    :cond_b
    aget-object v3, v2, v1

    const-string v4, "clip_vertical"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 487
    or-int/lit16 v0, v0, 0x80

    goto/16 :goto_2

    .line 489
    :cond_c
    aget-object v3, v2, v1

    const-string v4, "clip_horizontal"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 491
    or-int/lit8 v0, v0, 0x8

    goto/16 :goto_2

    .line 499
    .end local v0    # "gravity":I
    .end local v1    # "i":I
    .end local v2    # "split":[Ljava/lang/String;
    :cond_d
    const/16 v0, 0x11

    goto/16 :goto_1
.end method

.method private setPadding(Landroid/view/View;Landroid/util/AttributeSet;)V
    .locals 11
    .param p1, "v"    # Landroid/view/View;
    .param p2, "atts"    # Landroid/util/AttributeSet;

    .prologue
    .line 504
    const/4 v1, 0x0

    .line 505
    .local v1, "left":I
    const/4 v7, 0x0

    .line 506
    .local v7, "right":I
    const/4 v9, 0x0

    .line 507
    .local v9, "top":I
    const/4 v0, 0x0

    .line 509
    .local v0, "bottom":I
    const-string v10, "android:padding"

    invoke-direct {p0, p2, v10}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 510
    .local v2, "padding":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 512
    invoke-direct {p0, v2}, Lcom/kt/olleh/inapp/util/UIParser;->readDPSize(Ljava/lang/String;)I

    move-result v8

    .line 513
    .local v8, "size":I
    move v0, v8

    move v9, v8

    move v7, v8

    move v1, v8

    .line 516
    .end local v8    # "size":I
    :cond_0
    const-string v10, "android:paddingTop"

    invoke-direct {p0, p2, v10}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 517
    .local v6, "paddingTop":Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 519
    invoke-direct {p0, v6}, Lcom/kt/olleh/inapp/util/UIParser;->readDPSize(Ljava/lang/String;)I

    move-result v8

    .line 520
    .restart local v8    # "size":I
    move v9, v8

    .line 523
    .end local v8    # "size":I
    :cond_1
    const-string v10, "android:paddingBottom"

    invoke-direct {p0, p2, v10}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 524
    .local v3, "paddingBottom":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 526
    invoke-direct {p0, v3}, Lcom/kt/olleh/inapp/util/UIParser;->readDPSize(Ljava/lang/String;)I

    move-result v8

    .line 527
    .restart local v8    # "size":I
    move v0, v8

    .line 530
    .end local v8    # "size":I
    :cond_2
    const-string v10, "android:paddingLeft"

    invoke-direct {p0, p2, v10}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 531
    .local v4, "paddingLeft":Ljava/lang/String;
    if-eqz v4, :cond_3

    .line 533
    invoke-direct {p0, v4}, Lcom/kt/olleh/inapp/util/UIParser;->readDPSize(Ljava/lang/String;)I

    move-result v8

    .line 534
    .restart local v8    # "size":I
    move v1, v8

    .line 537
    .end local v8    # "size":I
    :cond_3
    const-string v10, "android:paddingRight"

    invoke-direct {p0, p2, v10}, Lcom/kt/olleh/inapp/util/UIParser;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 538
    .local v5, "paddingRight":Ljava/lang/String;
    if-eqz v5, :cond_4

    .line 540
    invoke-direct {p0, v5}, Lcom/kt/olleh/inapp/util/UIParser;->readDPSize(Ljava/lang/String;)I

    move-result v8

    .line 541
    .restart local v8    # "size":I
    move v7, v8

    .line 544
    .end local v8    # "size":I
    :cond_4
    invoke-virtual {p1, v1, v9, v7, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 545
    return-void
.end method


# virtual methods
.method public Start(Ljava/lang/String;)Landroid/view/View;
    .locals 8
    .param p1, "xmlFileFname"    # Ljava/lang/String;

    .prologue
    .line 87
    const/4 v3, 0x0

    .line 90
    .local v3, "parse":Lorg/xmlpull/v1/XmlPullParser;
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    .line 91
    .local v1, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v3

    .line 92
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 94
    .local v2, "is":Ljava/io/InputStream;
    if-nez v2, :cond_0

    .line 95
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/kt/olleh/inapp/util/UIParser;->hasResDir:Z

    .line 96
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "/res"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 99
    :cond_0
    const-string v5, "utf-8"

    invoke-interface {v3, v2, v5}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 100
    invoke-direct {p0, v3}, Lcom/kt/olleh/inapp/util/UIParser;->inflate(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    .line 111
    .end local v1    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v2    # "is":Ljava/io/InputStream;
    :goto_0
    return-object v4

    .line 103
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    const-string v5, "UIParser"

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 111
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :goto_1
    const/4 v4, 0x0

    goto :goto_0

    .line 107
    :catch_1
    move-exception v0

    .line 109
    .local v0, "e":Ljava/io/IOException;
    const-string v5, "UIParser"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public clear()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 58
    iget-object v0, p0, Lcom/kt/olleh/inapp/util/UIParser;->mHash:Ljava/util/Hashtable;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/kt/olleh/inapp/util/UIParser;->mHash:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 61
    iput-object v1, p0, Lcom/kt/olleh/inapp/util/UIParser;->mHash:Ljava/util/Hashtable;

    .line 64
    :cond_0
    iput-object v1, p0, Lcom/kt/olleh/inapp/util/UIParser;->mContext:Landroid/content/Context;

    .line 65
    return-void
.end method

.method public getID(Ljava/lang/String;)I
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/kt/olleh/inapp/util/UIParser;->mHash:Ljava/util/Hashtable;

    if-nez v0, :cond_0

    .line 70
    const/4 v0, -0x1

    .line 71
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/kt/olleh/inapp/util/UIParser;->mHash:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0
.end method

.method public getResourcePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/kt/olleh/inapp/util/UIParser;->hasResDir:Z

    if-eqz v0, :cond_0

    const-string v0, "/res/drawable-hdpi/"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "/drawable-hdpi/"

    goto :goto_0
.end method

.method public setID(Landroid/view/View;Ljava/lang/String;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 76
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, "split":[Ljava/lang/String;
    array-length v1, v0

    if-gtz v1, :cond_0

    .line 83
    :goto_0
    return-void

    .line 80
    :cond_0
    iget v1, p0, Lcom/kt/olleh/inapp/util/UIParser;->mIndex:I

    invoke-virtual {p1, v1}, Landroid/view/View;->setId(I)V

    .line 81
    iget-object v1, p0, Lcom/kt/olleh/inapp/util/UIParser;->mHash:Ljava/util/Hashtable;

    const/4 v2, 0x1

    aget-object v2, v0, v2

    new-instance v3, Ljava/lang/Integer;

    iget v4, p0, Lcom/kt/olleh/inapp/util/UIParser;->mIndex:I

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    iget v1, p0, Lcom/kt/olleh/inapp/util/UIParser;->mIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/kt/olleh/inapp/util/UIParser;->mIndex:I

    goto :goto_0
.end method
