	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A614
sub_0801A614: @ 0x0801A614
	push {lr}
	ldr r0, _0801A65C @ =gUnknown_0848A42C
	bl sub_080637AC
	adds r3, r0, #0
	cmp r3, #0
	beq _0801A656
	ldr r1, _0801A660 @ =gUnknown_03002F24
	ldr r2, [r1]
	ldr r0, [r3, #0x20]
	str r0, [r2, #4]
	adds r0, r3, #0
	adds r0, #0x42
	ldrb r0, [r0]
	strb r0, [r2, #2]
	ldr r2, [r1]
	adds r0, r3, #0
	adds r0, #0x48
	ldrh r0, [r0]
	strb r0, [r2]
	ldr r2, [r1]
	adds r0, r3, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	strb r0, [r2, #1]
	ldr r2, [r1]
	adds r0, r3, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	strb r0, [r2, #3]
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
_0801A656:
	pop {r0}
	bx r0
	.align 2, 0
_0801A65C: .4byte gUnknown_0848A42C
_0801A660: .4byte gUnknown_03002F24

