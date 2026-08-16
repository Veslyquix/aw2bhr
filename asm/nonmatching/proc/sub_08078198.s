	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078198
sub_08078198: @ 0x08078198
	push {r4, r5, r6, lr}
	ldr r0, _080781E0 @ =gUnknown_086147FC
	bl Proc_Find
	adds r6, r0, #0
	ldr r0, _080781E4 @ =gUnknown_0861485C
	bl Proc_Find
	adds r4, r0, #0
	ldr r0, _080781E8 @ =gUnknown_08614894
	bl Proc_Find
	adds r5, r0, #0
	ldr r0, _080781EC @ =gUnknown_08614614
	bl Proc_Find
	adds r2, r0, #0
	rsbs r0, r6, #0
	orrs r0, r6
	lsrs r0, r0, #0x1f
	rsbs r1, r4, #0
	orrs r1, r4
	lsrs r1, r1, #0x1f
	orrs r0, r1
	rsbs r1, r5, #0
	orrs r1, r5
	lsrs r1, r1, #0x1f
	orrs r0, r1
	rsbs r1, r2, #0
	orrs r1, r2
	lsrs r1, r1, #0x1f
	orrs r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080781E0: .4byte gUnknown_086147FC
_080781E4: .4byte gUnknown_0861485C
_080781E8: .4byte gUnknown_08614894
_080781EC: .4byte gUnknown_08614614

