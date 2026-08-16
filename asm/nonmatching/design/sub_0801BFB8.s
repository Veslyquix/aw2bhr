	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BFB8
sub_0801BFB8: @ 0x0801BFB8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	beq _0801BFD0
	ldr r0, _0801BFCC @ =gUnknown_0848B418
	adds r1, r4, #0
	b _0801BFD4
	.align 2, 0
_0801BFCC: .4byte gUnknown_0848B418
_0801BFD0:
	ldr r0, _0801BFF8 @ =gUnknown_0848B418
	movs r1, #3
_0801BFD4:
	bl Proc_Start
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	adds r0, r1, #0
	adds r0, #0x50
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	str r0, [r1, #0x54]
	adds r2, r1, #0
	adds r2, #0x52
	ldr r0, [sp, #0x18]
	strh r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BFF8: .4byte gUnknown_0848B418

