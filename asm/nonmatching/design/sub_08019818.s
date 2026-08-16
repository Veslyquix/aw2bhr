	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019818
sub_08019818: @ 0x08019818
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r1, #0x17
	bhi _08019836
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08019836:
	ldr r0, _08019848 @ =gUnknown_03002F08
	strh r1, [r0, #2]
	ldr r0, _0801984C @ =gUnknown_0848A3EC
	bl sub_080193B0
	str r4, [r0, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019848: .4byte gUnknown_03002F08
_0801984C: .4byte gUnknown_0848A3EC

