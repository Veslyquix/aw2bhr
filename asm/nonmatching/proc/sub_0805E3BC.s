	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805E3BC
sub_0805E3BC: @ 0x0805E3BC
	push {r4, lr}
	sub sp, #0xc
	bl sub_0805DA84
	ldr r4, _0805E42C @ =gUnknown_030013EC
	ldr r0, _0805E430 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	movs r3, #1
	str r3, [sp]
	ldr r4, [r4]
	movs r3, #0x78
	bl _call_via_r4
	movs r0, #0x79
	bl sub_0801FD9C
	add r0, sp, #4
	bl sub_0805A5E0
	ldr r1, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805E3F6
	bl sub_0805F7B8
_0805E3F6:
	ldr r2, [sp, #4]
	ldr r0, _0805E434 @ =gUnknown_08499594
	ldr r0, [r0]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r3, [r1, #2]
	ldr r2, _0805E438 @ =0xFFFF0000
	ldr r0, [sp, #8]
	ands r0, r2
	orrs r0, r3
	str r0, [sp, #8]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x10
	ldr r2, _0805E43C @ =0x0000FFFF
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #8]
	add r0, sp, #8
	bl sub_080591E4
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E42C: .4byte gUnknown_030013EC
_0805E430: .4byte gUnknown_030040D8
_0805E434: .4byte gUnknown_08499594
_0805E438: .4byte 0xFFFF0000
_0805E43C: .4byte 0x0000FFFF

