	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801527C
sub_0801527C: @ 0x0801527C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r5, _080152B8 @ =gUnknown_03001FBC
	ldrh r6, [r5]
	strh r4, [r5]
	adds r1, r4, #0
	bl sub_080151B0
	ldr r1, _080152BC @ =gUnknown_03001470
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r0, r0, r1
	movs r1, #4
	strh r1, [r0, #0x12]
	adds r0, r4, #0
	bl sub_08015A30
	strh r6, [r5]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080152B8: .4byte gUnknown_03001FBC
_080152BC: .4byte gUnknown_03001470

