	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024454
sub_08024454: @ 0x08024454
	push {r4, lr}
	ldr r3, _080244C0 @ =gUnknown_030030B4
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _080244C4 @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	movs r4, #1
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _080244C8 @ =gUnknown_03002B6C
	ldrb r0, [r2]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2]
	ldr r2, _080244CC @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	ldr r2, _080244D0 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	orrs r0, r4
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080244D4 @ =gUnknown_03003FC0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #1
	bne _080244E0
	ldr r1, _080244D8 @ =gUnknown_03002020
	movs r0, #0xa
	strh r0, [r1]
	ldr r1, _080244DC @ =gUnknown_03002B28
	movs r0, #8
	b _080244EA
	.align 2, 0
_080244C0: .4byte gUnknown_030030B4
_080244C4: .4byte gUnknown_03001FE8
_080244C8: .4byte gUnknown_03002B6C
_080244CC: .4byte gUnknown_0300251C
_080244D0: .4byte gUnknown_030030E0
_080244D4: .4byte gUnknown_03003FC0
_080244D8: .4byte gUnknown_03002020
_080244DC: .4byte gUnknown_03002B28
_080244E0:
	ldr r1, _080244F8 @ =gUnknown_03002020
	movs r0, #6
	strh r0, [r1]
	ldr r1, _080244FC @ =gUnknown_03002B28
	movs r0, #0x10
_080244EA:
	strh r0, [r1]
	bl sub_0801237C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080244F8: .4byte gUnknown_03002020
_080244FC: .4byte gUnknown_03002B28

