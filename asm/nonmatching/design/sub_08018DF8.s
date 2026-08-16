	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018DF8
sub_08018DF8: @ 0x08018DF8
	push {r4, lr}
	ldr r3, [r0, #0x14]
	movs r1, #8
	ldrsh r0, [r3, r1]
	ldr r1, _08018E20 @ =gUnknown_08499590
	ldr r2, [r1]
	movs r4, #4
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	movs r4, #0xa
	ldrsh r1, [r3, r4]
	movs r4, #6
	ldrsh r2, [r2, r4]
	subs r1, r1, r2
	ldr r2, [r3, #0xc]
	bl sub_08043418
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018E20: .4byte gUnknown_08499590

