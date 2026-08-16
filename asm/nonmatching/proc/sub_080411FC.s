	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080411FC
sub_080411FC: @ 0x080411FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x49
	ldrb r0, [r0]
	cmp r0, #0x13
	bhi _08041212
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _08041244
_08041212:
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x4a
	ldrb r1, [r5]
	bl sub_08041258
	ldrb r0, [r5]
	ldr r1, _0804124C @ =0x0000022A
	movs r2, #5
	bl sub_0804103C
	ldr r0, _08041250 @ =gUnknown_0849FE54
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r0, _08041254 @ =gUnknown_0849FD14
	adds r1, r4, #0
	bl Proc_Start
	ldrh r1, [r4, #0x3c]
	strh r1, [r0, #0x3c]
	ldrh r1, [r4, #0x3e]
	strh r1, [r0, #0x3e]
_08041244:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804124C: .4byte 0x0000022A
_08041250: .4byte gUnknown_0849FE54
_08041254: .4byte gUnknown_0849FD14

