	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C874
sub_0800C874: @ 0x0800C874
	movs r2, #0
	ldr r1, _0800C89C @ =gUnknown_03003150
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800C898
	movs r0, #0xb6
	lsls r0, r0, #1
	adds r3, r1, r0
_0800C884:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800C88C
	adds r2, #1
_0800C88C:
	adds r1, #4
	cmp r1, r3
	bgt _0800C898
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0800C884
_0800C898:
	adds r0, r2, #0
	bx lr
	.align 2, 0
_0800C89C: .4byte gUnknown_03003150

