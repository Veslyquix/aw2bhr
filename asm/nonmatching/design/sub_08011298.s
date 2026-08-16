	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011298
sub_08011298: @ 0x08011298
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, _080112B0 @ =gUnknown_03002B5C
	ldrh r0, [r2]
	cmp r0, #1
	bne _080112B4
	adds r0, r1, #0
	bl sub_080153B8
	b _080112E0
	.align 2, 0
_080112B0: .4byte gUnknown_03002B5C
_080112B4:
	movs r0, #1
	strh r0, [r2]
	adds r1, #0x64
	movs r4, #0
	movs r0, #1
	strh r0, [r1]
	bl sub_08011300
	bl sub_08011354
	ldr r0, _080112E8 @ =gUnknown_03001408
	strh r4, [r0]
	ldr r0, _080112EC @ =gUnknown_03002F3C
	strh r4, [r0]
	ldr r0, _080112F0 @ =gUnknown_0200B274
	ldr r1, _080112F4 @ =0x04000040
	ldr r3, _080112F8 @ =0x0000A240
	ldr r2, _080112FC @ =sub_08011228
	str r2, [sp]
	movs r2, #1
	bl sub_080111C8
_080112E0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080112E8: .4byte gUnknown_03001408
_080112EC: .4byte gUnknown_03002F3C
_080112F0: .4byte gUnknown_0200B274
_080112F4: .4byte 0x04000040
_080112F8: .4byte 0x0000A240
_080112FC: .4byte sub_08011228

