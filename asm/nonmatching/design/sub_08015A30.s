	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015A30
sub_08015A30: @ 0x08015A30
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, _08015A94 @ =gUnknown_03001470
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r2, r0, #5
	adds r1, r2, r3
	ldr r0, [r1]
	cmp r0, #0
	beq _08015A8C
	ldrh r0, [r1, #0x10]
	cmp r0, #0
	beq _08015A56
	subs r0, #1
	strh r0, [r1, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08015A8C
_08015A56:
	adds r0, r3, #0
	adds r0, #8
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08015A8C
	ldr r0, [r1]
	cmp r0, #0
	beq _08015A8C
	adds r0, r3, #4
	adds r1, r2, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _08015A8C
	ldr r6, _08015A98 @ =gUnknown_0848A160
	adds r4, r1, #0
_08015A76:
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015A76
_08015A8C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015A94: .4byte gUnknown_03001470
_08015A98: .4byte gUnknown_0848A160

