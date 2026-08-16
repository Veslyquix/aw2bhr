	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014BE8
sub_08014BE8: @ 0x08014BE8
	push {r4, r5, lr}
	ldr r0, _08014C74 @ =gUnknown_0848A140
	bl Proc_Find
	cmp r0, #0
	bne _08014C9C
	ldr r0, _08014C78 @ =gUnknown_0848A150
	bl Proc_Find
	cmp r0, #0
	bne _08014C6E
	ldr r0, _08014C7C @ =gUnknown_0848A130
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08014C9C
	ldr r0, _08014C80 @ =gUnknown_0848A120
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, r5
	bne _08014C6E
	ldr r0, _08014C84 @ =gUnknown_0849A520
	bl sub_08019290
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, r4
	bne _08014C6E
	ldr r0, _08014C88 @ =gUnknown_0849A5E0
	bl sub_08019290
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, r5
	bne _08014C6E
	ldr r0, _08014C8C @ =gUnknown_0849A8F0
	bl sub_08019290
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, r4
	bne _08014C6E
	ldr r0, _08014C90 @ =gUnknown_084C1824
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, r5
	bne _08014C6E
	ldr r0, _08014C94 @ =gUnknown_0849E240
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	bne _08014C6E
	bl sub_080366DC
	ldr r1, _08014C98 @ =sub_080369BC
	cmp r0, r1
	beq _08014C9C
_08014C6E:
	movs r0, #0
	b _08014C9E
	.align 2, 0
_08014C74: .4byte gUnknown_0848A140
_08014C78: .4byte gUnknown_0848A150
_08014C7C: .4byte gUnknown_0848A130
_08014C80: .4byte gUnknown_0848A120
_08014C84: .4byte gUnknown_0849A520
_08014C88: .4byte gUnknown_0849A5E0
_08014C8C: .4byte gUnknown_0849A8F0
_08014C90: .4byte gUnknown_084C1824
_08014C94: .4byte gUnknown_0849E240
_08014C98: .4byte sub_080369BC
_08014C9C:
	movs r0, #1
_08014C9E:
	pop {r4, r5}
	pop {r1}
	bx r1

