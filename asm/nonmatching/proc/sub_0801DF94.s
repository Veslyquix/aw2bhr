	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DF94
sub_0801DF94: @ 0x0801DF94
	push {r4, r5, r6, lr}
	ldr r0, _0801DFD8 @ =gUnknown_03002510
	movs r4, #0
	str r4, [r0]
	bl sub_0801A6C0
	ldr r1, _0801DFDC @ =gUnknown_03002B54
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0801DFE0 @ =gUnknown_03001FE4
	strh r4, [r0]
	movs r5, #0x80
	lsls r5, r5, #1
	ldr r6, _0801DFE4 @ =gUnknown_030024F0
_0801DFB0:
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r1, #0
	strb r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801E22C
	adds r4, #1
	cmp r4, #0x1f
	ble _0801DFB0
	bl sub_0801E0F0
	bl sub_0801E0A4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DFD8: .4byte gUnknown_03002510
_0801DFDC: .4byte gUnknown_03002B54
_0801DFE0: .4byte gUnknown_03001FE4
_0801DFE4: .4byte gUnknown_030024F0

