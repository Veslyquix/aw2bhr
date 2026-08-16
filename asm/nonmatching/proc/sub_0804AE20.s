	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804AE20
sub_0804AE20: @ 0x0804AE20
	push {lr}
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804AE40
	ldr r0, _0804AE44 @ =gUnknown_030044E0
	ldr r1, [r0]
	adds r1, #0x62
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0804AE48 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0804AE40:
	pop {r0}
	bx r0
	.align 2, 0
_0804AE44: .4byte gUnknown_030044E0
_0804AE48: .4byte gUnknown_03001FBC

