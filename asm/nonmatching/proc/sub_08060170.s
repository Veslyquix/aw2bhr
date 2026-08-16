	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060170
sub_08060170: @ 0x08060170
	push {lr}
	ldr r1, _080601B4 @ =gUnknown_030032D8
	movs r0, #1
	strh r0, [r1]
	bl sub_08025EA0
	ldr r1, _080601B8 @ =gUnknown_03004780
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080601BC @ =gUnknown_03003FC0
	ldr r2, _080601C0 @ =gUnknown_030046C0
	ldrb r1, [r2, #6]
	adds r0, #0x2e
	strb r1, [r0]
	ldr r1, _080601C4 @ =gUnknown_03004490
	ldrb r0, [r2, #7]
	strb r0, [r1]
	ldrb r0, [r2, #0xc]
	strb r0, [r1, #1]
	ldrb r0, [r2, #0xd]
	strb r0, [r1, #2]
	movs r3, #0
	adds r2, #0xe
	adds r1, #4
_080601A0:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	adds r3, #1
	cmp r3, #3
	ble _080601A0
	pop {r0}
	bx r0
	.align 2, 0
_080601B4: .4byte gUnknown_030032D8
_080601B8: .4byte gUnknown_03004780
_080601BC: .4byte gUnknown_03003FC0
_080601C0: .4byte gUnknown_030046C0
_080601C4: .4byte gUnknown_03004490

