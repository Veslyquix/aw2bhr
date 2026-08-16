	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C754
sub_0801C754: @ 0x0801C754
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	ldr r2, [r4, #0x58]
	bl sub_0801C254
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C77A
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _0801C774
	ldr r0, [r0]
	cmp r0, #0
	bne _0801C77A
_0801C774:
	adds r0, r4, #0
	bl Proc_End
_0801C77A:
	pop {r4}
	pop {r0}
	bx r0

