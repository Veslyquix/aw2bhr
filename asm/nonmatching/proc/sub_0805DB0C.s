	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805DB0C
sub_0805DB0C: @ 0x0805DB0C
	push {r4, lr}
	bl sub_0805E5AC
	ldr r0, _0805DB44 @ =gUnknown_03004784
	ldr r4, [r0]
	ldr r0, _0805DB48 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	movs r1, #0x64
	bl __umodsi3
	ldrb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _0805DB3A
	ldr r0, _0805DB4C @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0804415C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DB3E
_0805DB3A:
	bl sub_0805E718
_0805DB3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DB44: .4byte gUnknown_03004784
_0805DB48: .4byte gUnknown_030040D8
_0805DB4C: .4byte gUnknown_030033EC

